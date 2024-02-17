pageextension 50303 "Customer Card KP" extends "Customer Card"
{
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
                image = Hierarchy;
            }
        }
    }
}