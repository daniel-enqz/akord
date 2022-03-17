# SET THE DATE
### CHECK DEPLOYED <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"> APP HERE

> *PLACE SOME PROJECT IMAGES HERE (HOME PAGE OR OTHER RELEVANT PAGES)*

## Main APP Features
- A user can a create an event, and edit the same event.
- A user can't select past dates
'''ruby
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
  
  ![image](https://user-images.githubusercontent.com/71459774/158896156-2b1c8a7f-20b8-463e-b658-347a29f30e69.png)
   minDate: "today"
'''

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
 git clone git@github.com:daniel-enqz/set-the-date.git
 cd set-the-date
 rails db:create db:migrate db:seed:replant
 bundle install
 yarn install
 rails server
```
Open you browser and visit `localhost:3000`

CHANGING REMOTE NAME LOCALLY
`git remote set-url origin git@github.com:daniel-enqz/akord.git`
Then if you want, type `cd ..` and do `mv set-the-date akord` (this will change the folder in github to the new app name
