# Project title: PackAudio (寄信●寄心)

## Description: 
PackAudio is a `JDBC web application` for one of elective subject. According to the big data competition hosted by Chunghua Post Office in Taiwan in 2019, we choose Chunghua Post Office as our target and deliver a proposal for innovative postal service. We called it "PackAudio"! You can send packages/letters along with the video/audio you want to show to the recipient. It means that you can not only send packages to someone, but also share your feelings at the moment the recipent gets your items. 

Imaging you are sending a gift to your family, friends, lover etc, sometimes our emotion is beyond words. The card or phone call cannot show all of our feelings toward the recipient. Therefore, if you can make a video in advance. We, PackAudio team, can show the video and the gift or something to the targeted person, and make your feelings/emotion (affectionateness, thankfulness and so on) delivery in time.



## Team members:
We are team 2, our group memebers are as follows:
105034016 (黃提道) (HUANG, TI-DAO) (henry.2039@gmail.com )
105034017 (陳柏言) (CHEN, PO-YEN)    (junior71033@gmail.com )
105034053 (林佳蒨) (LIN, CHIA-CHIEN) (apple861229@gmail.com )
104034077 (郭則儀) (KUO, TSE-YI)           (janice072732@gmail.com)

Instructor: Dr. Hareesh, National Tsing Hua University.

**The project is organized in the following folders:**

1. Ideation

Nowadays, people pursue the efficiency but ignore the rudimentary relationship with people. PackAudio is trying to improve the problem by launching a build-up system over ChungHua Post Delivering Service.

2. Uml design

First, we talk about IPO cycle(input-process-output) and block diagram to demonstrate the whole system will be. Then, we make some use case diagram to interpret the relationship and operations between actors and actors in the PackAudio system.

3. Final project presentation

For our final project technology structure, we choose jsp, servlet to build up whole system because the lecturer of this course taught some Java programming in the beginning of the class. Plus, our team members are good at  Java language than others, therefore, Java programming is our choice.

For the final presentation delivering, we take this presentation as a product lunch. We use the simple structure(concept, target, benefit) to deliver our idea.
- concept: we not only talking about what PackAudio is but also using slogan "Send Packages. Heart Follows." to emphasize our idea.

- target: we talk about who would like to take the PackAudio service, and using a story which is about parents who want to attend to  their childrens' graduation ceremory to celebrate with their son/daughter but the they cannot make it for some reasons. Then, the parents can use PackAudio service to make sure there would be no regrets for this meaningful moment.

- benefit: based on the story mentioned above, we talk about the benefit PackAudio can bring. Re-emphasize that PackAudio is a kind of "add-value, emotion-spreading" distribution service.

"Send Packages. Heart Follows." This is PackAudio .

4. Demonstration video

Video link is [here](https://www.youtube.com/watch?v=DCDmf6KrrFM)

5. Code
<!--// we use C++ in our project,
// talk about how to run the code
//throw all your source code in the "5. Code" folder-->
It takes some steps to rebuild the environment of PackAudio project.
- step
    1. set up java enironment, Eclipse IDE(Java EE version), MySql 8
    2. set up the database
        - `create_database.sql` is in the folder `5. Code\web-order-tracker\database`
    3. put all the folders `web-order-tracker` into the Eclipse IDE workspacem then open it.
    4. build up all the jar file needed in this prohect
        - all the required jar is in the forder `5. Code\web-order-tracker\package`
    5. Find the `Context.xml`file to change the database connectivity setting
        - the file is in the folder `5. Code\web-order-tracker\WebContent\META-INF`
        - change the username, password, url for your MySql to log in
    6. There must be some error that `did not find the directory to upload the file or something` because we use the absolute paths to keep the videofile uploaded by the customers. Just change the directory you like, then it will work I hope.

6. Bugs and future improvements
- Negative video content filter: make sure not to use PackAudio service to hurt other people.
- To fulfill PacjAudio service, we must find the right person at the right moment at the right place. Which means that it will take more efforts to do the distribution work. Therefore, it's a huge problem we need to think about.
- To fulfill PackAudio service we also need the delivery men be patient and polite because they have to  not only send something but also interact with customers. How customers feel when facing the delivery man becomes so important. Therefore, we must do some training work to teach delivery men how to interact with customer properly.