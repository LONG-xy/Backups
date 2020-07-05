using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using log4net.Repository.Hierarchy;

namespace factory
{
    public class LogHelper
    {
        private static Logger instance;

        /// <summary>
        /// 
        /// </summary>
        public static Logger Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = Logger.GetLogger("Letter");
                }
                return instance;
            }
        }
    }
}
