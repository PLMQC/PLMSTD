table 33000945 "Maint. Sched. Line Proc B2B"
{

    Caption = 'Maint. Sched. Line Procedure';
    DrillDownPageID = "Maint. Sched. Line List B2B";
    LookupPageID = "Maint. Sched. Line List B2B";

    fields
    {
        field(1; "Machine Sched. Part No."; Code[20])
        {
            Caption = 'Machine Sched. Part No.';
            DataClassification = CustomerContent;
        }
        field(2; "Machine ID"; Code[20])
        {
            Caption = 'Machine ID';
            TableRelation = "Equipment B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if Machine.GET("Machine ID") then
                    "Machine Name" := Machine.Name
                else
                    "Machine Name" := '';
            end;
        }
        field(3; "Machine Name"; Text[50])
        {
            Caption = 'Machine Name';
            DataClassification = CustomerContent;
        }
        field(4; "Machine Sched. Line No."; Integer)
        {
            Caption = 'Machine Sched. Line No.';
            DataClassification = CustomerContent;
        }
        field(5; "Step No."; Integer)
        {
            AutoIncrement = false;
            Caption = 'Step No.';
            DataClassification = CustomerContent;
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Special Tools"; Text[150])
        {
            Caption = 'Special Tools';
            DataClassification = CustomerContent;
        }
        field(8; "Sl.No."; Integer)
        {
            Caption = 'Sl.No.';
            DataClassification = CustomerContent;
        }
        field(9; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Machine Sched. Part No.", "Machine ID", "Step No.", "Machine Sched. Line No.")
        {
        }
        key(Key2; "Sl.No.")
        {
        }
        key(Key3; "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Machine: Record "Equipment B2B";
}

