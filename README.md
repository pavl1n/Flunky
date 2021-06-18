# Flunky

Flunky is an online service providing food delivery from the restaurant.

---

## Sections

  - [General description](#general-description)
  - [Registration flow of the restaurant](#registration-flow-of-the-restaurant)
  - [Flow registration of the client](#flow-registration-of-the-client)
  - [The main components of the menu](#the-main-components-of-the-menu)
  - [The profile of registered roles](#the-profile-of-registered-roles)
  - [The process to editing the order](#the-process-to-editing-the-order)
  - [The description of the roles](#the-description-of-the-roles)
  - [Comments](#comments)
  - [The main page](#the-main-page)
  - [Order life cycle](#order-life-cycle)
  - [Getting Started](#getting-started)





---
## General description:

The service is a mediator between the client and the restaurant. The registration for the client is available immediately. The restaurants registration is provided via the administrator.

## Roles:
  * Admin

  * Client

  * Restaurant

---
## Registration flow of the restaurant

The registration of the restaurant is a multi-step process.

## Steps of the restaurant registration:

1.	Specify your mail address
2.	Phone number
3.	The address of the establishment
4.	The photo of the establishment

> After the registration of the main information is done, it’s required to fill in the menu information.

## The registration of the menu

1.	It’ s necessary to fill in at least one item of the dish
2.	Each item should contain one dish minimum (give a short description, photo, price)

## The following statuses of the restaurant registration are available
1.	The registration is waited for
2.	The correctness verification of the administrator is waited for
3.	Approved

## Validation while registering the restaurant
1.	If the main information is not filled in or is not done completely the transition to the registration of menu items is not possible.
2.	If the steps of filling in the menu are not  followed, the registration is impossible.

> After all the necessary information is filled in, the administrator verifies the correctness of all the data and either confirms or dismisses the request.

---

## Flow registration of the client
### The initial necessary fields
1.	Mobile phone number
2.	Password

After the fields are filled in, the client has to activate the account sending the message.
Having verified the  account in the personal profile, it’s required to fill in the following fields.

1.	Name
2.	E-mail
3.	City, address

> These fields are obligatory to have the registration completed.

If the above-mentioned information is filled in, the client can make an order on the Flunky.

> Client registration is an obligatory condition for making an order.
## At what moment Is the registration available?
The registration is available permanently. It the client wants to make an order without registration on the site, he will have to register.

## Registration are going through
 * The registration via Google account
 * Devise

---

## The main components of the menu
The entity with products is shown to the client in the form of the menu.

The menu contains the names of the dishes, price, description and the category

## Technical realization
The restaurant entity is connected with the entity of products and provides with the information of the certain restaurant, the name of a product, price and category.
The realization of the order is made via the order entity. This entity contains id of each product of all restaurants.

---

## The profile of registered roles.

After the registration, the client  has the opportunity to make an order on the site, but if the client is not registered in the system, he will be refused to make an order until he register on the web-site.

> The client can change his personal information  in his personal profile introduced during his initial registration.

> The restaurant profile contains the information about the establishment and the menu. In the personal profile there is an opportunity to make a request for the administrator to change or delete the items of the menu.

> The administrator profile contains the list of all registered restaurants, the list of open requests to add/change/delete the information of the product.

> Only the registered client under the role “client” can make an order.

---

## The process to editing the order

The  cart will be available for registered and not registered clients. The data in the cart is kept for an unlimited time. If an unregistered client makes the order, he will be offered to make an account.

---

## The description of the roles
> The administrator has the opportunity to accept the requests for creating and editing the information about restaurants, products, to delete and add clients in the roles of “restaurant” and “courier”. The administrator has the right to refuse the restaurant registration if it does not provide with its own production.

> The restaurant can change it's information, add or delete the dishes of its own range. The statuses of the restaurant: active (the restaurant functions, its entire menu is available, the clients can make orders), pause (the restaurant is not displayed, orders are not made, can be transferred into active).

> The client can add, delete, change goods in the cart and make an order, change personal information, leave the comments on the products.

---

## Comments

Only registered clients can leave comments on the products.

---
## The main page

The main page consists of
1.	Promotions
2.	Navigation bar
3.	Search option

---


## Order life cycle

Three stages:
1.	Waiting
2.	In progress
3.	Done

The order is available until the client is signed in and browser cookies are not flushed. The order in the cart can be cancelled by deleting products.

> If the client account is not activated and such fields as: name, e-mail and city are not filled in, he has no opportunity to make an order.

When the order is made by the client, each restaurant whose products are in this order receive a restaurant order.

This restaurant order includes id order, product names and quantity.  It has the same stages as the main order.

> The verification of updating these stages between the order and the restaurant order happens with Application Job every minute.

---
## Built with

* Ruby 3.0.0

* Rails 6.1.3.2

* PostgreSQL 13.2

* Elasticesearch 7.13.1

* Yarn 1.22.10

---
## Getting Started


In order to get repository local:

```
cd <folder>

git clone https://github.com/pavl1n/Flunky.git

 ```

Then install gems with:

```
bundle install
```
Install project manager with:

```
yarn or npm install
```

Creating database and uploading seeds:

> You need to have postgres installed before next commands

```
rails db:create
rails db:migrate
rails db:seed

```

To start background job:

> You need to have redis installed before next command
```
sidekiq
```

Elasticsearch install:

On mac using ```brew``` manager you should do the following:

```
brew tap elastic/tap

brew install elastic/tap/elasticsearch-full
```

In other cases please follow the official web-site with installing guide ```https://www.elastic.co/guide/en/elasticsearch/reference/current/install-elasticsearch.html```

After the installation, just make sure to start the service if it’s not started.

You can check that with curl:

>http://localhost:9200


And in the end:

```
rails s
```
