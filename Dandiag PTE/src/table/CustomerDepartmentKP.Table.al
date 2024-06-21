table 50300 "Customer Department KP"
{
    DataClassification = AccountData;

    fields
    {
        field(1; "Customer"; Code[20])
        {
            Caption = 'Customer';
            TableRelation = Customer."No.";
        }

        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }

        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }

        field(4; "Ship-To Code"; Code[20])
        {
            Caption = 'Ship-To Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field(Customer));
        }


    }

    keys
    {
        key(PK; "Code", Customer)
        {
            Clustered = true;
        }
    }

}