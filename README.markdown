== README

So, this has been a fun little project! If you somehow came here first, go check out my [CES Scorecard](http://scorecard.bradhubbard.net)

As I write this we are in the thick of CES 2014 and each year blogs, news organizations, and tech review sites try to publish as many articles they can as fast as they can. I was curious, in all the hurry to publish, which news and blogging sites were actually writing stuff people found informative enough to share. What you're looking at is a bar graph showing how often (in the last few days) various domains have had links to them posted anywhere public on Facebook, Twitter, or Reddit. Each time a new post contains a link, I snag it (more on how in a moment), parse out the domain, and increment a counter in a [Redis Cloud](http://redis-cloud.com/) database. So I'm keeping score of every public post and putting the results up for you to see. 

How could I accomplish such an unfathomable feat as watching EVERY Twitter post, Facebook story, and Reddit submission? I can't. That sort of information storage would take massive infrastructure and would be far more daunting to set up, configure, and store than I could fathom. Instead, I'm using a service called [DataSift](http://datasift.com), which does all the heavy lifting for me.

If you have any questions, feel free to post.