public with sharing class UserStoryGitSelections_EC {

	private final copado__User_Story__c myUserStory;

    // The extension constructor initializes the private member
    // variable myUserStory by using the getRecord method from the standard
    // controller.
    public UserStoryGitSelections_EC(ApexPages.StandardController stdController) {
        Id myUserStoryId = stdController.getRecord().id;

        // Retrieve the attributes we need
        this.myUserStory = [SELECT Id, Name, copado__User_Story_Title__c 
                              FROM copado__User_Story__c 
                             WHERE id= :myUserStoryId];

    }

    public String getRecordName() {
        return myUserStory.name + ' ' + myUserStory.copado__User_Story_Title__c;
    }

    /**
      Git Metadata Selections are stored in JSON in a Attachment on the Snapshot commit
    **/
    public List<CopadoMetadata> getGitMetadataSelections() {
        // Use the utility component implementation that is shared for all contexts
        return UserStoryCommitUtil.getGitMetadataSelections(myUserStory.id);
    }
}