pageextension 50304 "Contact Card KP" extends "Contact Card"
{
    layout
    {
        addafter("Salutation Code")
        {
            field(Initials; Rec.Initials)
            {
                ApplicationArea = All;
            }

            field("Customer Department"; Rec."Customer Department KP")
            {
                ApplicationArea = All;

                trigger OnAfterLookup(Selected: RecordRef)
                var
                    CustomerDepartment: Record "Customer Department KP";
                    fieldref: FieldRef;
                begin
                    Rec.Validate("Customer Department KP", Selected.Field(2).value());
                end;
            }
        }
    }
}