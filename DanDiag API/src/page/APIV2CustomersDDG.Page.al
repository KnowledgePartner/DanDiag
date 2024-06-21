page 50202 "APIV2 - Customers DDG"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Customer';
    EntitySetCaption = 'Customers';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'customerDDG';
    EntitySetName = 'customersDDG';
    PageType = API;
    SourceTable = Customer;
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';
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
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name';
                    ShowMandatory = true;
                }
                field(type; Rec."Contact Type")
                {
                    Caption = 'Type';
                }
                field(addressLine1; Rec.Address)
                {
                    Caption = 'Address Line 1';
                }
                field(addressLine2; Rec."Address 2")
                {
                    Caption = 'Address Line 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(state; Rec.County)
                {
                    Caption = 'State';
                }
                field(country; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(postalCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(phoneNumber; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(website; Rec."Home Page")
                {
                    Caption = 'Website';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(balanceDue; Rec."Balance Due")
                {
                    Caption = 'Balance Due';
                    Editable = false;
                }
                field(creditLimit; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit';
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                }
                field(taxAreaId; Rec."Tax Area ID")
                {
                    Caption = 'Tax Area Id';
                }
                field(vatRegistrationNumber; Rec."VAT Registration No.")
                {
                    Caption = 'Tax Registration No.';
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';

                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';

                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';

                }
                field(shipmentMethodId; Rec."Shipment Method Id")
                {
                    Caption = 'Shipment Method Id';

                }
                field(paymentMethodId; Rec."Payment Method Id")
                {
                    Caption = 'Payment Method Id';

                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';

                }
                field(customerType; Rec."DDG Customer Type")
                {
                    Caption = 'DDG Customer Type';
                    ApplicationArea = All;
                }

                field(customerGroup; Rec."DDG Customer Group")
                {
                    Caption = 'DDG Customer Group';
                    ApplicationArea = All;
                }

                field(abcCode; Rec."DDG ABC Code")
                {
                    Caption = 'DDG ABC Code';
                    ApplicationArea = All;
                }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }

                field(gln; Rec.GLN)
                {
                    ApplicationArea = All;
                    Caption = 'GLN';
                }

                field(name2; rec."Name 2")
                {
                    ApplicationArea = All;
                    Caption = 'Name 2';
                }

                field(billToCustomerNo; rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';
                }

                field(contact; Rec.Contact)
                {
                    ApplicationArea = All;
                    Caption = 'Contact';
                }
                part(customerFinancialDetails; "APIV2 - Cust Financial Details")
                {
                    Caption = 'Customer Financial Details';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'customerFinancialDetail';
                    EntitySetName = 'customerFinancialDetails';
                    SubPageLink = SystemId = Field(SystemId);
                }
                part(picture; "APIV2 - Pictures")
                {
                    Caption = 'Picture';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'picture';
                    EntitySetName = 'pictures';
                    SubPageLink = Id = Field(SystemId), "Parent Type" = const(Customer);
                }
                part(defaultDimensions; "APIV2 - Default Dimensions")
                {
                    Caption = 'Default Dimensions';
                    EntityName = 'defaultDimension';
                    EntitySetName = 'defaultDimensions';
                    SubPageLink = ParentId = Field(SystemId), "Parent Type" = const(Customer);
                }
                part(agedAccountsReceivable; "APIV2 - Aged AR")
                {
                    Caption = 'Aged Accounts Receivable';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'agedAccountsReceivable';
                    EntitySetName = 'agedAccountsReceivables';
                    SubPageLink = AccountId = Field(SystemId);
                }
                part(contactsInformation; "APIV2 - Contacts Information")
                {
                    Caption = 'Contacts Information';
                    EntityName = 'contactInformation';
                    EntitySetName = 'contactsInformation';
                    SubPageLink = "Related Id" = field(SystemId), "Related Type" = const(Customer);
                }
                part(documentAttachments; "APIV2 - Document Attachments")
                {
                    Caption = 'Document Attachments';
                    EntityName = 'documentAttachment';
                    EntitySetName = 'documentAttachments';
                    SubPageLink = "Document Id" = Field(SystemId), "Document Type" = const(Customer);
                }
            }
        }
    }
}