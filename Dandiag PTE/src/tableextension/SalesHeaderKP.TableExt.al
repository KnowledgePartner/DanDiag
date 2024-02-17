tableextension 50301 "Sales Header KP" extends "Sales Header"
{
    fields
    {
        field(50300; "Customer Department KP"; Code[20])
        {
            Caption = 'Customer Department';
            DataClassification = ToBeClassified;
            TableRelation = "Customer Department KP".Code where(Customer = field("Sell-to Customer No."));
        }
    }
}