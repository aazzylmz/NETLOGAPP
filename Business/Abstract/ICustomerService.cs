using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
 public  interface ICustomerService
    {

        bool Add(Customer customer);
        IEnumerable<Customer> GetAll();
        bool Delete(int ID);
    }
}
