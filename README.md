**chatty** is a Ruby on Rails chat application.
Submitted by: **Tiến Mạnh Đỗ**
Time spent: **26** hours spent in total
URL: **https://pure-gorge-59227.herokuapp.com/**
## User Stories

The following **required** functionality is complete:
* [x] User can sign up by providing their email, password, and name.
* [x] User can login using an email and password.
* [x] After logging in, the user is taken to a page that has a list of incoming messages, sorted in descending chronological order (newest messages at top), a "new message" link, an "add friends" link, and a "sent messages" link.
* [x] Clicking the "add friends" link takes the user to a page with all users listed, with a link to "add user to friends list".
* [x] Clicking on "new message" takes the user to a page where they can write a new mesasge. The recipient field should be a dropdown, where the options are names from the user's friends.
* [x] Clicking on "sent messages" takes the user to a page listing messages they have sent. Each message should display at what time it was read by the recipient, or "unread". The user cannot read the contents of the messages.
* [x] User can read a message's content only once. Once the message has been read, the user will see a page indicating the message has already been read.
* [x] User can only read messages where they are the recipient.
* [x] The User should be able to get for a menu item and see results.
* [x] User can attach an image: https://github.com/carrierwaveuploader/carrierwave.
* [x] User can log in with Facebook.
* [x] Implement Infinite Scroll.
* [x] User gets an email when they receive a message, with a link to view the message.
* [x] User gets an email when a message they have sent is read with the time at which the message was read.
* [x] User can remove friends from their friends list.

## Notes
My challenges when building the app are:
* Learning about model relationships.
* Simple_form

## Video Walkthrough

Here are 2 video walkthroughs of implemented user stories:
> `![Video Walkthrough](https://github.com/domanhtien2011/chatty/blob/master/Walkthrough1.gif)`
>
> `![Video Walkthrough](https://github.com/domanhtien2011/restaurant/blob/master/walkthrough2.gif)`
>
![Video Walkthrough]()
GIF created with [Byzanz](https://github.com/GNOME/byzanz)

## License

    Copyright [2016] [Tiến Mạnh Đỗ]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
