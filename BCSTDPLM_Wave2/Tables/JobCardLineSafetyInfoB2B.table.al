table 33000946 "Job Card  Line Safety Info B2B"
{

    Caption = 'Job Card  Line Safety Info';
    DrillDownPageID = "Job Card Procedure List B2B";
    LookupPageID = "Job Card Procedure List B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Card No."; Code[20])
        {
            Caption = 'Job Card No.';
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
        field(4; "Job Card  Line No."; Integer)
        {
            Caption = 'Job Card  Line No.';
            DataClassification = CustomerContent;
        }
        field(5; "Step No."; Integer)
        {
            Caption = 'Step No.';
            DataClassification = CustomerContent;
        }
        field(6; Description; Text[150])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Safety Equipment"; Text[50])
        {
            Caption = 'Safety Equipment';
            DataClassification = CustomerContent;
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = '" , No,Finished,Not Applicable,Additional"';
            OptionMembers = " "," No",Finished,"Not Applicable",Additional;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Job Card No.", "Machine ID", "Job Card  Line No.", "Step No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Machine: Record "Equipment B2B";
}

