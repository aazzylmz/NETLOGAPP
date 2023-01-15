﻿ 
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete.context
{
   public   class EticaretContext:DbContext
    {
        public EticaretContext() : base(@"Server=AZIZ-IS\SQLEXPRESS;Database=NetlogDemo;Trusted_Connection=true")
        {

        }
        protected override void OnModelCreating(DbModelBuilder dbModelBuilder)
        {
            dbModelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
        


    }
}