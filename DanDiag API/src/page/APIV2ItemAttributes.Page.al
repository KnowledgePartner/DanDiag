page 50203 "APIV2 - Item Attributes"
{
    PageType = API;
    Caption = 'ItemAttribute';
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';
    APIVersion = 'v2.0';
    EntityName = 'itemAttribute';
    EntitySetName = 'itemAttributes';
    SourceTable = "Item Attribute Value Mapping";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(tableId; rec."Table ID")
                {
                    Caption = 'tableId';

                }

                field(number; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }

                field(itemAttributeName; ItemAttributeName)
                {
                    Caption = 'Item Attribute Id';
                    ApplicationArea = All;
                }
                field(itemAttributeValue; ItemAttributeValueTxt)
                {
                    Caption = 'itemAttributeValue';
                    ApplicationArea = All;
                }

                field(unitOfMeasure; ItemAttributeUOM)
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure';
                }

            }
        }
    }

    trigger OnAfterGetRecord()
    var
        ItemAttributeValueRec: Record "Item Attribute Value";
        ItemAttribute: Record "Item Attribute";

    begin
        if ItemAttributeValueRec.Get(Rec."Item Attribute ID", Rec."Item Attribute Value ID") then
            ItemAttributeValueTxt := FORMAT(ItemAttributeValueRec.Value);

        if ItemAttribute.get(rec."Item Attribute ID") then begin
            ItemAttributeName := ItemAttribute.GetNameInCurrentLanguage();
            ItemAttributeUOM := ItemAttribute."Unit of Measure";
        end;

    end;

    var
        ItemAttributeValueTxt: Text[100];
        ItemAttributeName: Text[250];
        ItemAttributeUOM: text[30];

}