using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
   public class Item:IEntity
    {
        public int ID { get; set; }
        public string ITEMCODE { get; set; }

        public string ITEMNAME { get; set; }
        public float PRICE { get; set; }
         
    }
}
