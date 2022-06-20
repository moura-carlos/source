# README
---
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Admin dashboard](#admin-dashboard)
* [Modeling](#modeling)
* [Status](#status)
* [Testing the deployed application](#testing-the-deployed-application)
* [On production](#on-production)
***
## General info
### Source.
Nearly full-featured image stock e-commerce web application built with *Ruby on Rails.*
This app is the result of a  Ruby on Rails course found at [SuperHi](superhi.com).
***
## Technologies
The project is created with/makes use of:
* Bundler version 2.3.5
* Git
* Ruby on Rails version 6.1.6
* Ruby version 3.0.3
* JavaScript
* Stripe Payments API
* Heroku - Deployment
* PostgreSQL 12 (Production Environment) & Sqlite3 (Development Environment)
---
## Setup
To run this project - locally - on your machine:
```
$ cd your-folder/source
$ bundle install
$ yarn install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```
If you want to be able to use the **Stripe Payment** feature locally:
* Create an account on the Stripe website to be able to get API keys.
* Add your test credentials - API keys - to your Rails application.
 * Open your credentials file running the following command:
	+  In the example below I used the vim editor to edit my credentials, you can replace "vim" with your text editor of preference.
	+ ```$ EDITOR=vim rails credentials:edit```
	+ You can use the following names for your credentials so that they match the names that are already being used on the code:
```
	 secret_key_base: this_will_have_a_value_here
		 development:
			 stripe_publishable_key: add_your_stripe_publishable_test_key_here
			 stripe_secret_key: add_your_stripe_secret_test_key_here
		 test:
			 stripe_publishable_key: add_your_stripe_publishable_test_key_here
			 stripe_secret_key: add_your_stripe_secret_test_key_here
		 production:
			 stripe_publishable_key: add_your_stripe_publishable_test_key_here
			 stripe_secret_key: add_your_stripe_secret_test_key_here
```
For Stripe, you also need to create a new product and then add two plans (prices) to it.
* After creating the two plans - basic and pro - you will have access to their ids on the Stripe dashboard.
* Copy your plans' test ids.
 * Open your credentials file running the following command:
	+  In the example below I used the vim editor to edit my credentials, you can replace "vim" with your text editor of preference.
	+ ```$ EDITOR=vim rails credentials:edit```
	+ You can use the following names for your credentials so that they match the names that are already being used on the code:
```
	 secret_key_base: this_will_have_a_value_here
		 development:
      ...
			 stripe_basic_subscription_plan: add_your_stripe_basic_subscription_plan_id_here
			 stripe_pro_subscription_plan: add_your_stripe_pro_subscription_plan_id_here
		 test:
      ...
			 stripe_basic_subscription_plan: add_your_stripe_basic_subscription_plan_id_here
			 stripe_pro_subscription_plan: add_your_stripe_pro_subscription_plan_id_here
		 production:
      ...
			 stripe_basic_subscription_plan: add_your_stripe_basic_subscription_plan_id_here
			 stripe_pro_subscription_plan: add_your_stripe_pro_subscription_plan_id_here
```


* When you save and close the file you will be making sure your private Stripe API key is not available for everybody to see.

If you want to be able to **store your image files using amazon AWS S3**:

 * Go to the [amazon aws website](https://aws.amazon.com/) and create a new account.
 * Once logged in, click on **"IAM"** (Identity Account Management)
	 * Set up a new user - Select **Programmatic Access**
	 * Create a new group - Select **AmazonS3FullAccess**
	 * On the Review Page, click on **Create New User**
		 * This will give you an **Access key ID** and also a **Secret access key**, they are like a username and a password for **S3**
		 * Make sure to copy both and save them somewhere so that we can use them to set up our Rails AWS credentials.
* Now, look for the service **"S3"** and click on it.
	* Click on **Create bucket**, give it a name, leave the region as it is - use the default.
	* Copy and **save the bucket name** where you saved the other two AWS keys/credentials.
	* In manage public permissions, make sure you select **grant public read access to your bucket**
	* Make the bucket public by default.
	* You can follow the instructions on this answer [here](https://stackoverflow.com/a/70603995) to make sure you allow ACLs and AWS S3 can be properly used with your deployed app on Heroku.
* Open the file where you temporarily saved your AWS credentials you copied from the AWS website (**Access key ID**, **Secret access key**, **your bucket's name**) so that we can add them to our Rails application credentials file.
 * Open your credentials file running the following command:
	+  In the example below I used the vim editor to edit my credentials, you can replace "vim" with your text editor of preference.
	+ ```$ EDITOR=vim rails credentials:edit```
```
	 secret_key_base: this_will_have_a_value_here
		 development:
			 ...
			 ...
			 aws_access_key_id: add_your_aws_access_key_here
			 aws_secret_access_key: add_your_aws_secret_access_key_here
			 aws_bucket: add_your_aws_bucket_name_here
		 test:
			 ...
			 ...
			 aws_access_key_id: add_your_aws_access_key_here
			 aws_secret_access_key: add_your_aws_secret_access_key_here
			 aws_bucket: add_your_aws_bucket_name_here
		 production:
			 ...
			 ...
			 aws_access_key_id: add_your_aws_access_key_here
			 aws_secret_access_key: add_your_aws_secret_access_key_here
			 aws_bucket: add_your_aws_bucket_name_here
```
 * Save and close your credentials file, now your API keys are safely stored and can be indirectly referenced in your Rails application as explained in the following Rails [documentation](https://guides.rubyonrails.org/security.html#custom-credentials).
 * If you want to read more about how to use Amazon AWS and the Carrierwave gem you can access the following [documentation](https://github.com/carrierwaveuploader/carrierwave/#using-amazon-s3).
***
## Features
* As an admin, I can
	*  Create/Read/Update/Delete admin users.
  *  Create/Read/Update/Delete regular users.
	*  Create/Read/Update/Delete items' (pictures') categories.
	*  Create/Read/Update/Delete items (pictures).
* As a vistor, I can
  * View home page.
	* Sign up with a new subscription (Basic or Pro).
  * Log in
* As a User with an active Stripe subscription plan, I can
	* Download images
  * Change my subscription (from Pro to Basic or from Basic to Pro)
	* Cancel my subscription (when that happens the User credentials are also deleted an the User no longer has access to the website).
---
## Admin dashboard
* To access the admin dashboard you have to type ```/admin``` after the website full domain, for example, **https://example.com/admin**.
* The current crendetials to access the admin dashboard are:
	```
	login: carlos@example.com
	password: password
	```
* If you wish to add more admins to the app, go to ```confi/seeds.rb``` and add your new admin information. After that, save the file and run ```rails db:seed``` ( or ```heroku run rails db:seed```if you wish to save those changes to the production app ) to add the new admin to the database.
* Remember that before you can push new code to ```heroku```you have to ```git commit``` and ```git push``` to your GitHub repository first. So, after making those local changes, commit and push your code to GitHub and then you will be able to run ```git push heroku main```  and the new changes will be present in your production app.
---
## Modeling
* User - has some basic information -> name, username, email, password, subscription_plan
* Item - made of title and image, has many category_items, has many categories through category_items
* Category - made of a title, has many category_items, has many items through category_items
* Category Item - belongs to item, belongs to category.
***
## Status
* This project is complete, but I am still planning to improve its front end.
***
## Testing the deployed application
* Go to the website: [Source test website](https://carlos-source-staging.herokuapp.com/)
* To "subscribe" and be able to download images,  you can use the following test information:
    > Card number: 4242 4242 4242 4242
     MM/YY: 04/24
     CVC: 424
## On production
Make sure you set your Rails Master Key value for Heroku so that it knows how to read your encrypted API keys.
* Your master key value can be found in ```app/config/master.key```
	+ Once you copy that value, run the following command replacing ```VALUE_INSIDE_OF_YOUR_MASTER_KEY_FILE``` with the value you copied from ```master.key```
		+ ```$ heroku config:set RAILS_MASTER_KEY=VALUE_INSIDE_OF_YOUR_MASTER_KEY_FILE```
