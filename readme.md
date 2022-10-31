## User Stories:

As a user, so that I can manage my account and book/ list rooms I would like to be able to sign up for an account.

**Implementation:**
1. Database containing a users table - email address, mobile number, password
2. A create account form in a webpage, that has post methods for adding the above details
3. A login form in a webpage that can access the database and verify a user has an account
4. Use active record to handle authentication of users

As a signed-in user, I would like to be able to list spaces for rent.

As a signed-in user, so that I can provide a detailed description for my space, I would like to be able to add a title, description and price per night.

As a signed-in user I would like to be able to list multiple spaces for rent.

As a signed-in user I would like to be able to list my spaces on certain dates and for specific ranges of dates.

As a signed-in user I would like to be able to request to rent a space (for one or multiple nights?).

As a signed-in user who owns a space that has been requested for rental, I would like to be able to approve or deny that request.

As a user I would like to see only rooms that are available and have not already been booked by another user.
**Implementation:**
1.Search database by date, producing search results which exclude rooms that have already been booked.
2. Webpage displaying avaliable rooms- with details and images

As a user I would like my rooms to rent to still show as available until I have confirmed a booking.
**Implementation:**
1. Search result showing rooms avaliable on specific date only updates after booking has been confirmed, not when booking is made.
2. Webpage of search results updates after booking has been confirmed, to ensure no double bookings
3. If room is requested again after first request and before confirmation need a way to inform unsucessful user- via email

As a user I would like to receive email notifications whenever one of the following happens:

1. I sign up for an account.
2. I create a space for rent.
3. I update a space for rent.
4. A user requests to book my space.
5. I confirm a request to book my space.
6. I request to book a space.
7. My request to book a space is confirmed.
8. My request to book a space is denied.

**Implementation:**
1. Using email entry from user table a notification will be sent to the user after each of the previous events.
2. The message will be different depending on the users input/outcome of that input.
3. These messages will expect no reply.

As a user I would like to receive a text message to a provided number whenever one of the following happens:

1. A user requests to book my space.
2. My request to book a space is confirmed.
3. My request to book a space is denied.

As a user, once my booking has been approved I would like to be able to chat with the space owner within the app.

As a user I would like an easy way to pay for my bookings within the app, once they are confirmed by the space owner.
