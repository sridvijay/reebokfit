#Reebok Fit
![Reebok Fit](http://vijays.me/move.png "Reebok Fit")

Overview
=========

##Tech:
The app has 3 parts that should be developed:
- iOS Front-end
- Android Front-end (this can come later in a phase 2)
- Serverside Backend

####iOS:
Here’s the prototype code for the iOS front-end on github: https://github.com/sridvijay/reebokfit (public repository for now, please send github username so I can make it private) The iOS side needs to look really good for people to use it repeatedly. If you look at apps like Nike+, etc. They all had a team of amazing graphic designers.
- The iOS side will hold the code for all UI (obviously), and communication between the app and the server.
- In the prototype, I had created a singleton (FitAPI.m) , for all communication between the app and server, and used AFNetworking. 
- For the UI, I had made a side menu, using another open sourced project called RESideMenu.
- For storing all the data, I used a new tool called Realm, instead of using Core Data. Core Data gets really messy once things get big and complicated. Realm is exponentially simpler to use, and is wicked fast.
- For getting all the health data, HealthKit is available on iOS, and simple queries can help you retrieve all data from: steps taken, stairs climbed (iPhone 6 only), distance traveled, etc. This should automatically include data from all the devices that the user has and has set up with HealthKit. 

####Android:
- Android should not be a copy-cat of the iOS app UI-wise, but with a design that helps match Google’s new UI guidelines with Material Design. All other features should match the feature set of iOS.
- Google just released *Google Fit*, which is their competitor to HealthKit, and the process should be very similar in retrieving data. Since Android is much more open, it should be easy to get data from devices that don’t support Google Fit just yet.

####Server:
The server is primarily a smart database in this case. There’s 2 ways you can go with this:
- Create your own server from scratch.  (Might be the best option for cheap, cross-platform ability)
OR
- Use something like the newly released CloudKit for iOS (no cross platform compatibility, but dirt-cheap and fast) , or other database-as-a-service like Firebase, and Parse. (very fast to set up, but more expensive in the long run).
Here are some features that it needs to do as a database:
- Hold all the step data that the iOS/Android client sends.
- Hold a comprehensive profile of the user: only if the user gives permission to send these
	- Age
	- Gender
	- Favorite Activities
	- Fitness Level
	- Freetime
- Hold all group postings, and manage these groups when full.
- Algorithmically match people with groups that match as many characteristics as possible.
- Send out push notifications to remind users to use the app.
- Hold all the rewards, and add/remove points from user when redeemed.
- Have an easy-to-use admin ‘control panel’ system, where rewards can be easily added, edited, and removed.

##Reebok Fit:
A mobile app that introduces a point based rewards system based on how much your exercise, that introduces challenges to make it more exciting and a location-discovery system to find out new places to work out.

###Observations:
_tidbits of interesting information_

- Fitness isn’t accessible to people outside of school and college.
- People need extra incentivization in addition to the physical reward.
	- Less than 5% of adults participate in 30 minutes of physical activity each day; only one in three adults receive the recommended amount of physical activity each week. (2010 study from U.S Department of Agriculture pg.11).
	- People who are fit, don’t find use for apps that only focus on people trying to get fit (i.e Couch to 5K, 7 minute workout, etc.)
- Movements like the November Project seem to get much more traction.
- Challenging other people seems to engage users much more than just leaderboards.
- People don’t like in-your-face apps that spam you with notifications.
- Apps that only work with certain brands, are horrible at scaling and acquiring users. (Think average user with Jawbone +, who wants to use the Nike FuelBand app).
	- Not everyone runs with their phone, but a lot of people do with fitness tracking devices.
- Partnerships with local organizations helps make products seem more down-to-earth and friendly (yes, products do in fact exhibit these characteristics).
- Smart Watches, are in fact becoming a thing, ripe for disruption.
- Many companies are becoming health-focused (including Apple).

##Features:

###Points:
The best way at tracking exercise.

Points are almost always used in the context of a game. By tracking users’ progress using points, you create a 1-unit system that can be used to compare one users progress with another’s. 1 user could be an avid long-distance runner, while another might be a gymnast. Typically, you wouldn’t be able to compare these 2 activities, but if you take the effort, in finding out ~equivalents, you can compare say 3 miles of running, with 1 hour of gymnastics. Furthermore, by using the motion sensing, and GPS data from a users devices, you can make the reading even more accurate. 

For now, as soon as you download the app, you immediately have points. How is this so? Any user with an iPhone 5S and above, has a special chip in their phone called the M8 motion coprocessor. This tracks your steps, and how far you’ve walked without you even knowing. We can access this data, and immediately give users a look at how active they’ve been.
1st impressions mean a lot. Especially in the world of apps. You have about 30 seconds to show that the app has user before:
a) The app never gets used again.
b) The app gets deleted.
or even worse:
c) User has a bad experience with the app and spreads negative reviews.

By starting off the user with points that accurately reflect the amount of activity they’ve been doing, the user feels like they’ve already been using the apps for days. In the prototype app, the basic function was that 8% of the steps you took in the past week, became the amount of initial points you had. But what about activities that can’t be tracked accurately like Yoga? That’s discussed in the accessibility section below. Some apps, and companies have tried to throw in “points” into their app as a lazy-baked way to ‘gamify’ their product. This. never. works. Points, alone mean nothing. Can they allow users to compare each other’s relative fitness? Yes. But it’s not enough. This leads to a 1-time use case. 

###Rewards:
Increases Brand Recognition; Promotes re-use; Incentivizes users.

The best way to increase brand recognition, is to associate good feelings with a brand. The key thing is that users worked to get these points. When you take this effort, and reward a user for taking the time out of their life to stay healthy, I would guess that they would feel good. Those shoes that you got, were because you worked hard. When you associate these positive feelings with a brand, the chance that a user will sway to that brand in the future get exponentially higher.

These rewards, can promote existing promotions, such as the free rental of workout gear at specific hotel chains. Half the problem of some promotions, is that people don’t know about them. This helps solve 2 problems in one. 

Furthermore, rewards can help Reebok partner with local businesses. Partnering with local businesses to help increase their engagement with Reebok’s users, not only helps them with marketing, but helps Reebok in showing that it truly cares about it’s brand value of helping the communities it’s in. If a user gets a free week’s worth of a local CrossFit gym membership, they’re more likely to go it because they spent their  points on it. It’s not just a free advertisement they see on the web, but something they clicked and spent what was equivalent to 50 miles of running on it. 

Will this solve all the problems? Of course not. The more important thing, is that it’s a step in the right direction. By adding analytics into the app, you can see how users use points (if at all), and you can see which products users like based on their demographic. It’s another valuable data source that can be used to further customize Reebok products, and marketing strategies in the future.

###Smart Groups:
A step in solving the problem that makes exercise fun.

Less than 5% of adults in the United States get 30 minutes of exercise everyday. Pretty pathetic. A large portion of this problem can be connected to the absence of groups for people who aren’t connected to any organizations.
Let’s break it down, albeit in a slightly stereotypical manner:

- When you’re young, between the ages of 4-12, most parents put their kids in at least 1 recreational sport, whether it’s soccer, football, or ice hockey, etc.

- When you’re between the ages of 12-18, you’re usually involved in some sport in your school. Once you hit high school, you’re in a much more serious athletic sport, playing games or racing meets within your division, county, state, region, and even sometimes nationally. Great example of this is the Reebok Manhattan Invitational for XC. This is when many people are at their prime athletic ability.

- When you’re between the ages of 18-24, you might be associated with a running club, or rowing club in your school. You’re still active, but maybe not as active as you were in high school. This becomes more a problem as you reach your last years in an ‘educational’ environment like college or university.

- Once you leave university, you’re out in the real world. You have to work most of the day, have bills to pay, meetings to attend, etc, etc. You say you’ll go to the gym, but at the last minute something deemed ‘more important’ pops up. You’ll postpone it to the next day. And it’ll happen the next day. You ask your friends to run with you, but they’re even lazier than you are, and you sure as heck don’t want to run with the weirdo next door who wakes up at 6 in the morning to go run 10 miles. ’I just don’t have the time…’, ‘None of my friends want to run’, etc, etc, and soon enough you’ll forget about it. Next New Year’s, the cycle repeats.

- Once you’re older, possibly retired, you may start again, you don’t have much else to do, and exercise becomes more fun. You and your buddies go on walks, and you suddenly become health-conscious because all those years of postponing exercise, have finally caught up to you.
People between the ages 35-64 are the ones who have exercise on the back on their minds, who are on the peripheral. This is the target audience Reebok Fit is trying to acquire.
Over 50% of these adults, have smartphones.

By allowing people to add in data such as:
- Their fitness ability (something like their personal records in the 5k, mile, etc.)
- Their age
- Their gender
- Their available times

We can take all this data, run it through a matching algorithm, and connect people who wouldn’t otherwise have known about each other. By creating groups of 6 people, we can eliminate the problem of not finding people to exercise with. The problem of not being able to go because you’re too busy, also is partially eliminated, as it’ll only match people who have similar athletic abilities, who are available at the same time. By adding a messaging feature, you can increase the levels of accountability within the group. Instead of just not showing up, someone can message you, asking why. This, obviously, can be an opt-out feature, but leaving it on makes the entire experience real.

###Accessibility:
Getting data from everything.

With the recent outbreak of fitness tracking devices, it is imperative that no user is left out in the dust because of their particular brand of device. Any company that fails to recognize this, excludes users, and provides a horrible user experience. To our luck, Apple has introduced HealthKit in iOS 8. HealthKit allows users and apps to edit and add health-related data, in a shared database that is available across all apps on their device. By plugging into HealthKit, we can acquire data from all the devices that a user may have, giving Reebok Fit unparalleled access to everything health related to the user.

###Reebok City:
Crowd-sourcing routes, gyms, and great places to exercise.

By allowing people to add running routes, and great places to work out and exercise, we can share the ‘secret’ places of a city to everyone who has the app. If you don’t know where to run, boom! Running routes, that can be curated, are immediately shown to you. Just set up a run: 6:30 pm, 5 miles, 7:30 per mile. At 6:20 pm, you’ll get an alert that’ll pop-up on your phone, with a running route already selected for you. Something new, something that allows you to explore your own city. It’s like someone baby-feeding you with everything you’ll need.On top of that, people can rate their favorite gyms, and create place-marks for places with great views, hills, or anything unique to share with other people in the city.

###Profiles:
See what your friends have been doing, and check out what pro-athletes have been doing too!

With profiles, you can check up to see what routes your friends might have ran. By connecting to Twitter and Facebook, Reebok Fit can gather data from all your friends and see how you compare to them. Then, you can even compare yourself to your entire city!
With the ability to follow other people, you can even check out to see what pro-athletes have been doing. This helps bring even more people onto the platform.

