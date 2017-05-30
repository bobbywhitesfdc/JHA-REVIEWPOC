public with sharing class UserStoryListController {

    @TestVisible private final ApexPages.StandardSetController standardController;

    public UserStoryListController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }


    /**
      Page Level Init method
    **/
    public PageReference init() {
        return null;
    }

    /**
      Git Metadata Selections are stored in JSON in a Attachment on the Snapshot commit
      Get the Selections from the Standard List Controller
    **/
    public List<CopadoMetadata> getGitMetadataSelections() {
        List<Id> usList = new List<Id>();
        for (copado__User_Story__c current : (List<copado__User_Story__c>) standardController.getSelected()) {
            usList.add(current.id);
        }
        return UserStoryCommitUtil.getGitMetadataSelections(usList);
    }

}