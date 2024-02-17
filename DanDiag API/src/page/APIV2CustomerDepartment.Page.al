namespace Microsoft.API.V2;

using Microsoft.CRM.Contact;

page 50208 "APIV2 - Customer Departments"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Customer Department';
    EntitySetCaption = 'Customer Department';
    DelayedInsert = true;
    EntityName = 'customerDepartmentDDG';
    EntitySetName = 'customerDepartmentsDDG';
    ODataKeyFields = "SystemId";
    PageType = API;
    SourceTable = "Customer Department KP";
    APIPublisher = 'knowledgePartner';
    APIGroup = 'ddg';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                }
                field(customer; Rec.customer)
                {
                    ApplicationArea = All;
                }

                field(code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field(shipToCode; Rec."Ship-To Code")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}