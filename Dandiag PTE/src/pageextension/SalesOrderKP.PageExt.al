pageextension 50305 "Sales Order KP" extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Contact No.")

        {
            field("Customer Department KP"; Rec."Customer Department KP")
            {
                ApplicationArea = All;
            }
        }

    }
}