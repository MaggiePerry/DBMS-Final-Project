# DBMS-Final-Project

Final project for COMP 3753: Database Managment Systems

__Premise:__
Develop a relational database schema and related web API’s for a retail store.
The client has indicated they want to be able to track their customer’s purchases and manage inventory. The client was asked what information they would like to get out of the system, and they identified the following reports:
- Sales Reports:
    - by time period
    - by customer

Provide the SQL script to create the database (and populate tables with any necessary data) and provide them with an API (RESTful web services using PHP). The RESTFUL API will provide CRUD (Create, Retrieve, Update and Delete) services for the following:
- Customers
- Orders
    - w/Items Ordered
- Inventory (Items)

The application will use the APIs to lookup a customer (search), retrieve the customer or create a new customer, and create an order (containing a list of items in the order) and mark its status (open, shipped, received, cancelled), as some examples. Of course, with the API CRUD functionality, the application will also allow for things like editing an order (adding and removing items, etc.), editing a customer’s profile (demographic data), and managing inventory. Reports will also be retrieved via an API.

(RESTFUL API is not required)

All files written and created by Maggie Perry and John Marcoux
