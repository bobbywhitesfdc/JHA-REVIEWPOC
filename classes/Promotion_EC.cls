public with sharing class Promotion_EC {

	private final copado__Promotion__c myPromotion;

    // The extension constructor initializes the private member
    // variable myPromotion by using the getRecord method from the standard
    // controller.
    public Promotion_EC(ApexPages.StandardController stdController) {
        Id promotionId = ((copado__Promotion__c) stdController.getRecord()).id;

        // Retrieve the attributes we need
        this.myPromotion = [SELECT Id, Name
                              FROM copado__Promotion__c 
                             WHERE id= :promotionId];
    }

    public String getRecordName() {
        return myPromotion.name;
    }

    /**
      Git Metadata Selections are stored in JSON in a Attachment on the Snapshot commit
    **/
    public List<CopadoMetadata> getGitMetadataSelections() {
        List<Id> usList = new List<Id>();
        for (copado__Promoted_User_Story__c current : [SELECT id, Name, copado__User_Story__c 
                                                         FROM copado__Promoted_User_Story__c
                                                        WHERE copado__Promotion__c = :myPromotion.id]) {
            usList.add(current.copado__User_Story__c);
        }
        return UserStoryCommitUtil.getGitMetadataSelections(usList);
    }

}