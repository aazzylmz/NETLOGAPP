using Core.DataAccess;
using DataAccess.Abstract;
using DataAccess.Concrete.context;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete
{
    public class EFCustomerDal : EfEntityRepository<Customer, EticaretContext>, ICustomerDal
    {
    }
}
