# AKORD.ME
### CHECK DEPLOYED <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"> APP HERE

> *PLACE SOME PROJECT IMAGES HERE (HOME PAGE OR OTHER RELEVANT PAGES)*
> ![image](https://user-images.githubusercontent.com/71459774/160005281-4f165673-1262-4ebe-8f84-09840b7330c0.png)


## Main APP Features
- A usear can Sing_in and Log_ing in the app to create a new event and edit

![image](https://user-images.githubusercontent.com/71459774/160005074-400d9022-9085-45bb-bf40-4584bc160d99.png)

![image](https://user-images.githubusercontent.com/71459774/160004990-901a42b1-10bb-46c0-a9a4-e20b9d1e97f8.png)

- A user can't select past dates
```ruby
  validate :votable_date_before_today
  def votable_dates
    votable_dates_strings.map { |ds| ::Date.parse(ds) }
  end

  private

  def votable_date_before_today
    errors.add(:votable_dates_strings, "Cannot select past dates") if any_past_dates?
  end

  def any_past_dates?
    votable_dates.any? { |date| date < ::Date.current }
  end
```
![image](https://user-images.githubusercontent.com/71459774/160004122-2b7d312b-205d-4f1e-9600-ef0207de8b1b.png)
- A user can share the event with a button, the funtion is a combination beteween Ruby code and Js.
```ruby
<% if current_user&.owns?(@event) %>
      <div data-controller="clipboard" data-clipboard-feedback-text-value="Copied!">
        <input value="<%= short_join_event_url(@event.funid) %>" data-clipboard-target="input" type="text" readonly>
        <button class="btn btn-primary" data-action="click->clipboard#copy">Share with your compas</button>
      </div>
    <%end%>
```
```JavaScript
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    this.inputTarget.select();
    document.execCommand('copy');
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
  }
}

```
![image](https://user-images.githubusercontent.com/71459774/160005495-55bd3fa2-32fe-4ccd-9ed0-0315527b9487.png)
- Attendees can join in the Join_page, only need to write the username
![image](https://user-images.githubusercontent.com/71459774/160006498-20e7a29f-158a-41d5-8eeb-485f1417dbbc.png)

- Attendees can vote for different dates for the event in an interactive way (Using Hammer.js for swiping animations)
![image](https://user-images.githubusercontent.com/71459774/160006608-220132d7-0cae-49d5-8cb1-2bcc9f9bf73f.png)- Attendees can see LIVE event updates
```ruby
<div class="progress-outer">
        <div class="progress">
            <div class="progress-bar progress-bar-info progress-bar-striped active"
            style="width: <%= event_date.progress_bar_value %>%; box-shadow:-1px 10px 10px rgba(91, 192, 222, 0.7);"></div>
        </div>
      </div>
```
![image](https://user-images.githubusercontent.com/71459774/160003834-da5cedae-d38b-45c8-8d71-93db7fb6df17.png)


## APP DB SCHEMA
![image](https://user-images.githubusercontent.com/72522628/158682746-1f6e0c6d-0b9d-4e76-bf93-7a9aadbad80f.png)


## Things you may want to cover to initialize this project:
### Versions
> <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"> <strong> 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-linux]</strong><br>
> <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white"> <strong> 6.1.4.6 </strong>
### Tools Used
> Active Record (Example: `rails g model`) <br>
> Heroku Deployment `heroku/7.59.2 linux-x64 node-v12.21.0 `<br>
> `pgcrypto` (in order to add `:uuid` or <strong>Universally unique identifier</strong> to an attendee, so that a user logged in can also vote) <br>
>  `hashid rails` Instead the event model ID using sequential numbers like 1, 2, 3, it will instead have unique short hashes like "yLA6m0oM" <br>
> <img src="https://user-images.githubusercontent.com/72522628/158295411-9dd5ff4a-e40c-4d15-a0b9-0ec257d5ea6f.png"> <br>
> gem 'devise' <br>
> gem "faker" <br>
> gem "groupdate" <br>
> gem "hashid-rails", "~> 1.0" <br>

## Setup

```shell
 git clone git@github.com:daniel-enqz/akord.git
 cd akord
 rails db:create db:migrate db:seed:replant
 bundle install
 yarn install
 rails server
```
Open you browser and visit `localhost:3000`
