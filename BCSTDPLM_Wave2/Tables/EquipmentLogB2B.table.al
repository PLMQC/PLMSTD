table 33000908 "Equipment Log B2B"
{

    Caption = 'Equipment Log';
    DrillDownPageID = "Posted Equipment Log B2B";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "User ID"; Code[30])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(3; "Journal Template Name"; Code[20])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Res. Journal Template";
            DataClassification = CustomerContent;
        }
        field(5; "Journal Batch Name"; Code[20])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
            TableRelation = "Res. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(6; "Machine No."; Code[20])
        {
            Caption = 'Machine No.';
            DataClassification = CustomerContent;
            TableRelation = "Equipment B2B";
        }
        field(9; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            DataClassification = CustomerContent;
        }
        field(11; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            DataClassification = CustomerContent;
        }
        field(12; "End Time"; DateTime)
        {
            Caption = 'End Time';
            DataClassification = CustomerContent;
        }
        field(13; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '" ,Run Time,Stop Time,Meters"';
            DataClassification = CustomerContent;
            OptionMembers = " ","Run Time","Stop Time",Meters;
        }
        field(14; "Total Minutes"; Decimal)
        {
            Caption = 'Total Minutes';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(15; UOM; Code[10])
        {
            Caption = 'UOM';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "Capacity Unit of Measure";
        }
        field(16; "P/B Type"; Option)
        {
            Caption = 'P/B Type';
            DataClassification = CustomerContent;
            OptionCaption = '"PMR,BreakDown, "';
            OptionMembers = PMR,BreakDown," ";
        }
        field(19; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(20; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(22; Remarks; Text[100])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(23; "Machine Description"; Text[50])
        {
            Caption = 'Machine Description';
            DataClassification = CustomerContent;
        }
        field(24; "Time Duration"; Duration)
        {
            Caption = 'Time Duration';
            DataClassification = CustomerContent;
        }
        field(25; "Time(Hrs)"; Decimal)
        {
            Caption = 'Time(Hrs)';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
        }
        field(35; Meters; Decimal)
        {
            Caption = 'Meters';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "Posting Date")
        {
        }
        key(Key3; Type, "Machine No.")
        {
            SumIndexFields = "Time(Hrs)", "Total Minutes", Meters;
        }
        key(Key4; Type, "Machine No.", "P/B Type")
        {
            SumIndexFields = "Time(Hrs)", "Total Minutes", Meters;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        LOCKTABLE();
        ResJnlTemplate.GET("Entry No.");
        ResJnlBatch.GET("Entry No.", "Journal Template Name");
    end;

    var
        ResJnlTemplate: Record "Res. Journal Template";
        ResJnlBatch: Record "Res. Journal Batch";
}

