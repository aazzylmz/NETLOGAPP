using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
    public interface IOrderService
    {
        bool Add(OrderFiche orderFiche);
        OrderFiche get(string Fisno);
    }
}
