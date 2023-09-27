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
        }
    }
}