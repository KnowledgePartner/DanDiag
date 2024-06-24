page 50207 "APIV2 - Contacts Info. DDG"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Contact Information';
    EntitySetCaption = 'Contacts Information';
    DelayedInsert = true;
    EntityName = 'contactInformationDDG';
    EntitySetName = 'contactsInformationDDG';
    ODataKeyFields = "Contact Id";
    PageType = API;
    SourceTable = "Contact Information Buffer";
    SourceTableTemporary = true;
    Extensible = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(contactId; Rec."Contact Id")
                {
                    Caption = 'Contact Id';
                }
                field(contactNumber; Rec."Contact No.")
                {
                    Caption = 'Contact No.';
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                }
                field(contactType; Rec."Contact Type")
                {
                    Caption = 'Contact Type';
                }
                field(relatedId; Rec."Related Id")
                {
                    Caption = 'Related Id';
                }
                field(relatedType; Rec."Related Type")
                {
                    Caption = 'Related Type';
                    Editable = false;
                }
                part(contacts; "APIV2 - Contacts DDG")
                {
                    Caption = 'Contacts';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'contactDDG';
                    EntitySetName = 'contactsDDG';
                    SubPageLink = SystemId = field("Contact Id");
                }
            }
        }
    }

    trigger OnFindRecord(Which: Text): Boolean
    var
        RelatedIdFilter: Text;
        RelatedTypeFilter: Text;
        FilterView: Text;
    begin
        RelatedIdFilter := Rec.GetFilter("Related Id");
        RelatedTypeFilter := Rec.GetFilter("Related Type");
        if RelatedIdFilter = '' then begin
            Rec.FilterGroup(4);
            RelatedIdFilter := Rec.GetFilter("Related Id");
            RelatedTypeFilter := Rec.GetFilter("Related Type");
            Rec.FilterGroup(0);
            if (RelatedIdFilter = '') or (RelatedTypeFilter = '') then
                Error(FiltersNotSpecifiedErrorLbl);
        end;
        if RecordsLoaded then
            exit(true);
        FilterView := Rec.GetView();
        Rec.LoadDataFromFilters(RelatedIdFilter, RelatedTypeFilter);
        Rec.SetView(FilterView);
        if not Rec.FindFirst() then
            exit(false);
        RecordsLoaded := true;
        exit(true);
    end;

    var
        RecordsLoaded: Boolean;
        FiltersNotSpecifiedErrorLbl: Label 'id type not specified.';
}