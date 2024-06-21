pageextension 50300 CustomerListKP extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field("Address"; Rec.Address)
            {
                ApplicationArea = All;
                Caption = 'Address';
                ToolTip = 'Address';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                Caption = 'Address 2';
                ToolTip = 'Address 2';
            }
            field("GLN"; Rec.GLN)
            {
                ApplicationArea = All;
                Caption = 'GLN';
                ToolTip = 'GLN';
            }
        }
    }
    actions
    {
        addafter(ShipToAddresses)
        {
            action("Customer Department")
            {
                ApplicationArea = All;
                RunObject = page "Customer Department List KP";
                RunPageLink = "Customer" = field("No.");
                Promoted = true;
                Image = Hierarchy;
            }
        }
    }
}