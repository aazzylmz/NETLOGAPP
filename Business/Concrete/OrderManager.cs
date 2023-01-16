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
    public class OrderManager : IOrderService
    {
        IOrderFicheDal _orderFicheDal;

        public OrderManager(IOrderFicheDal orderFicheDal)
        {
            _orderFicheDal = orderFicheDal;
        }

        public bool Add(OrderFiche orderFiche)
        {
            bool result;
            try
            {
                _orderFicheDal.Add(orderFiche);
                result = true;
            }
            catch (Exception ee)
            {
                result = false;

            }
            return result;
        }

        public OrderFiche get(string Fisno)
        {
            return _orderFicheDal.Get(x => x.FICHENO == Fisno);
        }
    }
}
