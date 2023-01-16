using Business.Abstract;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
   public class OrderLineManager :IOrderLineService
    {
        IOrderLineDal _orderLineDal;
        public OrderLineManager(IOrderLineDal orderLineDal)
        {
            _orderLineDal = orderLineDal;
        }


        public bool Add(OrderLine orderLine)
        {
            bool result;
            try
            {
                _orderLineDal.Add(orderLine);
                result = true;
            }
            catch (Exception ee)
            {
                result = false;

            }
            return result;
        }
    }
}
