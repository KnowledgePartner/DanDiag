page 50204 "APIV2 - Item Categories DDG"
{
    PageType = API;
    Caption = 'ItemCategory';
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';
    APIVersion = 'v2.0';
    EntityName = 'itemCategory';
    EntitySetName = 'itemCategories';
    SourceTable = "Item Category";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(parentCategory; Rec."Parent Category")
                {
                    Caption = 'Description';
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
            }
        }
    }
}