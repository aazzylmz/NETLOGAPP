using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class OrderLine : IEntity
    {
        public int ID { get; set; }
        public int ORDERFICHEID { get; set; }
        public int ITEMID { get; set; }
        public decimal UNITPRICE { get; set; }
        public int AMOUNT { get; set; }

    }
}
