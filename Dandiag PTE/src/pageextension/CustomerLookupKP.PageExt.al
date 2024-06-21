pageextension 50302 CustomerLookupKP extends "Customer Lookup"
{
    layout
    {
        addafter(Name)
        {
            field("GLN"; Rec."GLN")
            {
                ApplicationArea = All;
                Caption = 'GLN';
                Tooltip = 'GLN';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
            }

        }
    }
}