//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace User_Manage.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Autorisation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Autorisation()
        {
            this.Application_Role_Autorisations = new HashSet<Application_Role_Autorisations>();
        }
    
        public int id_autorisation { get; set; }
        public string nom_autorisation { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Application_Role_Autorisations> Application_Role_Autorisations { get; set; }
    }
}
