//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace BBSSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_ForumMain
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_ForumMain()
        {
            this.tb_ForumInfoStatus = new HashSet<tb_ForumInfoStatus>();
            this.tb_ForumSecond = new HashSet<tb_ForumSecond>();
        }
    
        public int ID { get; set; }
        public string Title { get; set; }
        public int ForumAreaID { get; set; }
        public int ForumClassifyID { get; set; }
        public int CreateUserID { get; set; }
        public System.DateTime CreateTime { get; set; }
        public string Content { get; set; }
        public bool IsRecommend { get; set; }
        public bool Isdelete { get; set; }
        public int IsExamine { get; set; }
        public Nullable<int> Zan { get; set; }
    
        public virtual tb_ForumArea tb_ForumArea { get; set; }
        public virtual tb_ForumClassify tb_ForumClassify { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_ForumInfoStatus> tb_ForumInfoStatus { get; set; }
        public virtual tb_UsersByCustomer tb_UsersByCustomer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_ForumSecond> tb_ForumSecond { get; set; }
    }
}
