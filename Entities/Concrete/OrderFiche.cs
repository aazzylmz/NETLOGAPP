using Entities.Abstract;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class OrderFiche : IEntity
    {
        public int ID { get; set; }
        public string FICHENO { get; set; }

        public DateTime ORDERTARİH { get; set; }
        public int CUSTOMERID { get; set; }
        public decimal TOTALPRICE { get; set; }


        public DateTime? DELIVERYDATE { get; set; }
        public string DELIVERYPLAKA { get; set; }
        public string DELIVERYNAME { get; set; }
    }
}
