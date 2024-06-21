page 50307 "Customer Department List KP"
{
    Caption = 'Customer Department List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Customer Department KP";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = All;
                }

                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Ship-To Code"; Rec."Ship-To Code")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}