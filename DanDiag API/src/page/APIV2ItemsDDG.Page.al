page 50200 "APIV2 - ItemsDDG"
{
    PageType = API;
    Caption = 'items';
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';
    APIVersion = 'v2.0';
    EntityName = 'itemDDG';
    EntitySetName = 'itemsDDG';
    SourceTable = Item;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }
                field(displayName2; Rec."Description 2")
                {
                    Caption = 'Display Name 2';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(itemCategoryId; Rec."Item Category Id")
                {
                    Caption = 'Item Category Id';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';

                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';

                }
                field(gtin; Rec.GTIN)
                {
                    Caption = 'GTIN';

                }
                field(inventory; InventoryValue)
                {
                    Caption = 'Inventory';

                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';

                }
                field(priceIncludesTax; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes Tax';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';

                }
                field(taxGroupId; Rec."Tax Group Id")
                {
                    Caption = 'Tax Group Id';

                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';

                }
                field(baseUnitOfMeasureId; Rec."Unit of Measure Id")
                {
                    Caption = 'Base Unit Of Measure Id';

                }
                field(baseUnitOfMeasureCode; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure Code';

                }
                field(generalProductPostingGroupId; Rec."Gen. Prod. Posting Group Id")
                {
                    Caption = 'General Product Posting Group Id';

                }
                field(generalProductPostingGroupCode; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'General Product Posting Group Code';

                }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group Id")
                {
                    Caption = 'Inventory Posting Group Id';

                }
                field(inventoryPostingGroupCode; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group Code';

                }

                field(webshopDDG; Rec."DDG Webshop")
                {
                    Caption = 'DDG Webshop';
                    ApplicationArea = All;
                }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }

                part(itemAttributes; "APIV2 - Item Attributes")
                {
                    Caption = 'Item Attributes';
                    EntityName = 'itemAttribute';
                    EntitySetName = 'itemAttributes';
                    SubPageLink = "Table ID" = filter(database::Item), "No." = field("No.");
                }
                part(marketingText; "APIv2 - Entity Text")
                {
                    Caption = 'Marketing Text';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'entityText';
                    EntitySetName = 'entityTexts';
                    SubPageLink = Company = const('Dandiag A/S'), "Source Table Id" = const(27), "Source System Id" = field(SystemId);

                }
                part(inventoryPostingGroup; "APIV2 - Inventory Post. Group")
                {
                    Caption = 'Inventory Posting Group';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'inventoryPostingGroup';
                    EntitySetName = 'inventoryPostingGroups';
                    SubPageLink = SystemId = field("Inventory Posting Group Id");
                }
                part(generalProductPostingGroup; "APIV2 - Gen. Prod. Post. Group")
                {
                    Caption = 'General Product Posting Group';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'generalProductPostingGroup';
                    EntitySetName = 'generalProductPostingGroups';
                    SubPageLink = SystemId = field("Gen. Prod. Posting Group Id");
                }
                part(baseUnitOfMeasure; "APIV2 - Units of Measure")
                {
                    Caption = 'Unit Of Measure';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'unitOfMeasure';
                    EntitySetName = 'unitsOfMeasure';
                    SubPageLink = SystemId = field("Unit of Measure Id");
                }
                part(picture; "APIV2 - Pictures")
                {
                    Caption = 'Picture';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'picture';
                    EntitySetName = 'pictures';
                    SubPageLink = Id = field(SystemId), "Parent Type" = const(Item);
                }
                part(defaultDimensions; "APIV2 - Default Dimensions")
                {
                    Caption = 'Default Dimensions';
                    EntityName = 'defaultDimension';
                    EntitySetName = 'defaultDimensions';
                    SubPageLink = ParentId = field(SystemId), "Parent Type" = const(Item);
                }
                part(itemVariants; "APIV2 - Item Variants")
                {
                    Caption = 'Variants';
                    EntityName = 'itemVariant';
                    EntitySetName = 'itemVariants';
                    SubPageLink = "Item Id" = field(SystemId);
                }
                part(documentAttachments; "APIV2 - Document Attachments")
                {
                    Caption = 'Document Attachments';
                    EntityName = 'documentAttachment';
                    EntitySetName = 'documentAttachments';
                    SubPageLink = "Document Id" = field(SystemId), "Document Type" = const(Item);
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
        companyvar := CompanyName;
    end;


    trigger OnOpenPage()
    begin
        Rec.SetAutoCalcFields(Rec.Inventory);
    end;

    local procedure SetCalculatedFields()
    begin
        // Inventory
        InventoryValue := Rec.Inventory;
    end;

    var
        InventoryValue: Decimal;
        Companyvar: text;
}