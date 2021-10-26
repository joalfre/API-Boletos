# README

version de ruby          2.7.3
version de rails         6.1.4.1
version de PostgreSQL    9.5

Requerimientos realizados
1. Un ADMIN puede dar de alta y modificar ORGANIZADORES.
2. Un ADMIN puede dar de alta y modificar un VENUE.
3. Un ORGANIZADOR puede crear un EVENTO.
4. Un ADMIN y un ORGANIZADOR pueden cancelar un evento
6. TODOS los boletos tienen costo de $0 pesos
7. Un EVENTO no puede tener más BOLETOS que la capacidad del VENUE

Requerimiento no realizado
5. Si se cancela se deberá notificar a todos los COMPRADORES

URL de despligue en Heroku 
- https://hidden-hamlet-36350.herokuapp.com

Uso de la API empleando Postman
El sistema tiene cargado un usuario administrador por defecto que es con el cual se opera el sistema
usuario:  admin
contraseña: temporal

Logueo
Se tiene un usuario administrador por defecto.

POST https://hidden-hamlet-36350.herokuapp.com/api/v1/auto_login

{
    "username": "admin",
    "password": "temporal"
}

Posteriormente 
En la URL
GET  https://hidden-hamlet-36350.herokuapp.com/api/v1/auto_login

Agregar el token en Authorization -> Bearer-Token 
Ejemplo de token:
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.JC6qKuH9SG0SIiYSfhZUFTtirxN9Q47buLk0DPFFFzE



Modulo Usuarios

Ver Ususarios
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/users

Ver Usuario
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/users/id

Crear Usuarios
POST https://hidden-hamlet-36350.herokuapp.com/api/v1/users
Para la creacion de usuario solo se admiten 3 tipos de roles "ADMINISTRADOR", "ORGANIZADOR", "COMPRADOR"

{
    "username": "usuario",
    "password": "contraseña",
    "rol": "ADMINISTRADOR",
    "name": "nombre",
    "email": "nombre@example.com"
}


Actualizar Usuario
PUT https://hidden-hamlet-36350.herokuapp.com/api/v1/users/id

{
    "username": "usuariox",
    "password": "contraseña",
    "rol": "ADMINISTRADOR",
    "name": "nombrex",
    "email": "nombrex@example.com"
}



Modulo Venues

Ver Venues
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/venues

Ver Venue
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/venues/id

Creación de un Venue
El campo capacidad solo admite enteros positivos

{
    "name": "lugar",
    "address": "direccion",
    "capacity": "34"
}

Actualizar Venue
PUT https://hidden-hamlet-36350.herokuapp.com/api/v1/users/id

Eliminar Venue
DELETE https://hidden-hamlet-36350.herokuapp.com/api/v1/users/id


Eventos

Ver Eventos
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/events

Ver Evento
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/events/id

Creación de un Venue
POST https://hidden-hamlet-36350.herokuapp.com/api/v1/events
El campo capacidad solo admite enteros positivos, tambien se tiene que agregar el id del venue
{
    "name": "evento",
    "event_date": "2021-10-26",
    "event_time": "12:00",
    "status": "activo",
    "venue_id": "7"
}

Actualizar evento
PUT https://hidden-hamlet-36350.herokuapp.com/api/v1/events/id

Eliminar Evento
DELETE https://hidden-hamlet-36350.herokuapp.com/api/v1/events/id


Tickets

Ver Tickets
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/events/2/tickets

Ver Ticket
GET https://hidden-hamlet-36350.herokuapp.com/api/v1/events/2/tickets

Creación de un Ticket
POST https://hidden-hamlet-36350.herokuapp.com/api/v1/events/2/tickets
El campo capacidad solo admite enteros positivos

{
    "cost": "0.0",
    "quantities": "4"
}

Actualizar tickets
PUT https://hidden-hamlet-36350.herokuapp.com/api/v1/events/2/tickets/

Eliminat Tickets
Actualizar tickets
DELETE https://hidden-hamlet-36350.herokuapp.com/api/v1/events/2/tickets