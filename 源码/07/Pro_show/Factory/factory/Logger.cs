using System;
using System.Collections;
using System.Collections.Generic;

using log4net;

[assembly: log4net.Config.XmlConfigurator(Watch = true)]

namespace factory
{
    /// <summary>
    /// 我改了一下这个封装的Logger类, 主要考虑以下几点，请参考：
    /// 
    /// 1. Log级别
    ///    debug : 当我们需要自己测试跟踪执行状态的时候要打debug级别log，这种级别的log可以根据开发人员的意愿随意打
    ///    info  : 应该在每一个业务或处理流程的关键步骤打Info级别的Log
    ///    warn  : 出现非法输入的时候，要打该级别log。比如我们的Web Service被非法调用
    ///    error : 出现异常要用该级别
    ///    fatal : 出现致命异常导致系统或处理不能继续运行时使用
    ///    
    /// 2. 由于随着系统模块，功能的增加，我们的系统会越来越复杂庞大，此时，对于我们的n层架构，每一层的log就不应该设置相同的级别和
    ///    不能记录到同一个文件中。
    ///    比如，我们可以把Service的logger设置warn级别记录到service.log; BLL的logger使用info级别记录到bll.log; DAL设置为error级别记录到dll.log
    /// 
    /// 3. 不管是windows，还是我们常用的其他软件，log信息里不仅仅是错误，会有很多关键info信息，我们的程序发布后打log也要遵循该宗旨
    /// 
    /// 4. Log不仅仅在出错时才使用，而是系统管理员或程序开发人员跟踪系统运行状态的重要依据，所以完善的Log机制是框架必备部分
    /// 
    /// 目前这个Logger类兼备了以上功能，而且还方便扩展
    /// </summary>
    public class Logger
    {
        #region Static Block

        /// <summary>
        /// Keep all the loggers in a static Dictionary, 
        /// When need a logger, return it without constructor
        /// 因为Logger实例可以重用，为了防止每次都新建Logger的实例，将logger的实例进行缓存
        /// 当需要Logger实例时，首先从该字典中检索，如果已经有对应的Logger, 则直接将其返回，否则新创建实例
        /// </summary>
        private static readonly Dictionary<string, Logger> AllLogers;
        static Logger()
        {
            AllLogers = new Dictionary<string, Logger>();
            AllLogers.Add("ROOT", new Logger("ROOT"));
        }

        /// <summary>
        /// Get the root Logger
        /// 取得Log4net的配置文件中<logger name="root">节点的配置来进行log的输出
        /// </summary>
        /// <returns></returns>
        public static Logger GetLogger()
        {
            return AllLogers["ROOT"];
        }

        /// <summary>
        /// Get Logger by name specified(ignore case)
        /// 取得Log4net的配置文件中<logger name="该函数的参数name的值">节点的配置来进行log的输出，
        /// 如果没有，则会使用<logger name="root">节点
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static Logger GetLogger(string name)
        {
            Logger ret = null;
            if (string.IsNullOrEmpty(name))
            {
                ret = GetLogger();
            }
            else
            {
                //忽略大小写
                name = name.ToUpper();
                if (AllLogers.ContainsKey(name))
                {
                    ret = AllLogers[name];
                }
                else
                {
                    //对于Server端的web程序等多线程应用程序，此处是临界区，需要做个同步
                    lock (AllLogers)
                    {
                        if (AllLogers.ContainsKey(name))
                        {
                            ret = AllLogers[name];
                        }
                        else
                        {
                            ret = new Logger(name);
                            AllLogers.Add(name, ret);
                        }
                    }
                }
            }

            return ret;
        }

        #endregion

        #region Property

        private string name;
        public string Name
        {
            private set { name = value; }
            get { return name; }
        }

        private ILog realLogger;
        public ILog RealLogger
        {
            private set { realLogger = value; }
            get { return realLogger; }
        }

        #endregion

        #region Constructor

        private Logger(string name)
        {
            this.Name = name;
            this.RealLogger = log4net.LogManager.GetLogger(this.Name);
        }

        #endregion

        /// <summary>
        /// No used
        /// </summary>
        /// <param name="args"></param>
        /// <returns></returns>
        protected static object[] FormatArgs(params object[] args)
        {
            for (int i = 0; i < args.Length; i++)
            {
                if (args[i] is IList && args[i] != null)
                {
                    args[i] = ((IList)args[i]).Count;
                }
            }

            return args;
        }

        #region Public Method

        public bool IsDebugEnabled
        {
            get
            {
                return this.RealLogger.IsDebugEnabled;
            }
        }

        public bool IsInfoEnabled
        {
            get
            {
                return this.RealLogger.IsInfoEnabled;
            }
        }

        public bool IsWarnEnabled
        {
            get
            {
                return this.RealLogger.IsWarnEnabled;
            }
        }

        public bool IsErrorEnabled
        {
            get
            {
                return this.RealLogger.IsErrorEnabled;
            }
        }

        public bool IsFatalEnabled
        {
            get
            {
                return this.RealLogger.IsFatalEnabled;
            }
        }

        /// <summary>
        /// 为了方便调用，参数都是用object类型，类型转换交由log4net去做
        /// </summary>
        /// <param name="message"></param>
        /// <param name="ex"></param>
        public void Debug(object message, Exception ex)
        {
            //这个if判断是log4net官方推荐的标准写法，能少了一次函数调用，会减少log机制对系统性能的影响
            if (RealLogger.IsDebugEnabled)
            {
                RealLogger.Debug(message, ex);
            }
        }

        public void Debug(object message)
        {
            if (RealLogger.IsDebugEnabled)
            {
                RealLogger.Debug(message);
            }
        }

        public void DebugFormat(string format, params object[] args)
        {
            if (RealLogger.IsDebugEnabled)
            {
                RealLogger.DebugFormat(format, args);
            }
        }

        public void Info(object message, Exception ex)
        {
            if (RealLogger.IsInfoEnabled)
            {
                RealLogger.Info(message, ex);
            }
        }

        public void Info(object message)
        {
            if (RealLogger.IsInfoEnabled)
            {
                RealLogger.Info(message);
            }
        }

        public void InfoFormat(string format, params object[] args)
        {
            if (RealLogger.IsInfoEnabled)
            {
                RealLogger.InfoFormat(format, args);
            }
        }

        public void Warn(object message, Exception ex)
        {
            if (RealLogger.IsWarnEnabled)
            {
                RealLogger.Warn(message, ex);
            }
        }

        public void Warn(object message)
        {
            if (RealLogger.IsWarnEnabled)
            {
                RealLogger.Warn(message);
            }
        }

        public void WarnFormat(string format, params object[] args)
        {
            if (RealLogger.IsWarnEnabled)
            {
                RealLogger.WarnFormat(format, args);
            }
        }

        public void Error(object message, Exception ex)
        {
            if (RealLogger.IsErrorEnabled)
            {
                RealLogger.Error(message, ex);
            }
        }

        public void Error(object message)
        {
            if (RealLogger.IsErrorEnabled)
            {
                RealLogger.Error(message);
            }
        }

        public void ErrorFormat(string format, params object[] args)
        {
            if (RealLogger.IsErrorEnabled)
            {
                RealLogger.ErrorFormat(format, args);
            }
        }

        public void Fatal(string message, Exception ex)
        {
            if (RealLogger.IsFatalEnabled)
            {
                RealLogger.Fatal(message, ex);
            }
        }

        public void Fatal(string message)
        {
            if (RealLogger.IsFatalEnabled)
            {
                RealLogger.Fatal(message);
            }
        }

        public void FatalFormat(string format, params object[] args)
        {
            if (RealLogger.IsFatalEnabled)
            {
                RealLogger.FatalFormat(format, args);
            }
        }

        #endregion
    }
}