package com.gemalto.dao;

import com.gemalto.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {

        // get the current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // create a query ... sort by last name
        Query<Customer> query = session.createQuery("from Customer order by lastName",
                Customer.class);

        // execute query and get result list
        List<Customer> customers = query.getResultList();

        // return the results
        return customers;
    }

    @Override
    public void saveCustomer(Customer customer) {

        // get hibernate session
        Session session = sessionFactory.getCurrentSession();

        // save the customer in db
        /*session.save(customer);*/
        session.saveOrUpdate(customer);
    }

    @Override
    public Customer getCustomer(int id) {

        // get hibernate session
        Session session = sessionFactory.getCurrentSession();

        // retreive/read from database using the primary key
        Customer customer = session.get(Customer.class, id);
        return customer;
    }
}
