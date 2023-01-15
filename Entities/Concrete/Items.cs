using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
   public class Items:IEntity
    {
        public int ID { get; set; }
        public string ITEMCODE { get; set; }

        public string ITEMNAME { get; set; }
        public decimal PRICE { get; set; }
         
    }
}
