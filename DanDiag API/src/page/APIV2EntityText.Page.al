page 50201 "APIV2 - Entity Text"
{
    PageType = API;
    Caption = 'Entity Text';
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';
    APIVersion = 'v2.0';
    EntityName = 'entityText';
    EntitySetName = 'entityTexts';
    SourceTable = "Entity Text";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(systemId; rec.SystemId)
                {
                    Caption = 'SystemId';

                }
                field(sourceTableId; Rec."Source Table Id")
                {
                    ApplicationArea = All;
                }
                field(sourceSystemId; rec."Source System Id")
                {
                    ApplicationArea = All;
                }
                field(entityTextValue; entityTextValue)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        EntityText: Codeunit "Entity Text";
    begin
        entityTextValue := EntityText.GetText(rec."Source Table Id", rec."Source System Id", Rec.Scenario::"Marketing Text")
    end;

    var
        entityTextValue: text;
}