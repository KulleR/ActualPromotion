//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Brio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public string Tile { get; set; }
        public Nullable<int> ResponsibleUserId { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public System.DateTime CreateDate { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual User User { get; set; }
    }
}