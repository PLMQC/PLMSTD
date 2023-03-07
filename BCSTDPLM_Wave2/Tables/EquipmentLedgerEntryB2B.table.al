table 33000944 "Equipment Ledger Entry B2B"
{


    Caption = 'Equipment Ledger Entry';
    DrillDownPageID = "Equiment Ledger Entries B2B";
    LookupPageID = "Equiment Ledger Entries B2B";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            TableRelation = IF (Type = CONST("Machine Center")) "Machine Center"
            ELSE
            IF (Type = CONST("Work Center")) "Work Center";
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = '"Work Center,Machine Center, "';
            DataClassification = CustomerContent;
            OptionMembers = "Work Center","Machine Center"," ";
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; "Operation No."; Code[10])
        {
            Caption = 'Operation No.';
            DataClassification = CustomerContent;
        }
        field(9; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            TableRelation = "Work Center";
            DataClassification = CustomerContent;
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(11; "Setup Time"; Decimal)
        {
            Caption = 'Setup Time';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(12; "Run Time"; Decimal)
        {
            Caption = 'Run Time';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(13; "Stop Time"; Decimal)
        {
            Caption = 'Stop Time';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(15; "Invoiced Quantity"; Decimal)
        {
            Caption = 'Invoiced Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(16; "Output Quantity"; Decimal)
        {
            Caption = 'Output Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(17; "Scrap Quantity"; Decimal)
        {
            Caption = 'Scrap Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(19; "Concurrent Capacity"; Decimal)
        {
            Caption = 'Concurrent Capacity';
            DataClassification = CustomerContent;
        }
        field(28; "Cap. Unit of Measure Code"; Code[10])
        {
            Caption = 'Cap. Unit of Measure Code';
            DataClassification = CustomerContent;
            TableRelation = "Capacity Unit of Measure";
        }
        field(29; "Qty. per Cap. Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Cap. Unit of Measure';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(33; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(34; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = CustomerContent;
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(39; "Last Output Line"; Boolean)
        {
            Caption = 'Last Output Line';
            DataClassification = CustomerContent;
        }
        field(42; "Completely Invoiced"; Boolean)
        {
            Caption = 'Completely Invoiced';
            DataClassification = CustomerContent;
        }
        field(43; "Starting Time"; Time)
        {
            Caption = 'Starting Time';
            DataClassification = CustomerContent;
        }
        field(44; "Ending Time"; Time)
        {
            Caption = 'Ending Time';
            DataClassification = CustomerContent;
        }
        field(50; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            DataClassification = CustomerContent;
            TableRelation = "Production Order"."No." WHERE(Status = FILTER(Released ..));
        }
        field(51; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            DataClassification = CustomerContent;
            TableRelation = "Prod. Order Line"."Line No." WHERE(Status = FILTER(Released ..),
                                                                 "Prod. Order No." = FIELD("Prod. Order No."));
        }
        field(52; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            DataClassification = CustomerContent;
            TableRelation = "Routing Header";
        }
        field(53; "Routing Reference No."; Integer)
        {
            Caption = 'Routing Reference No.';
            DataClassification = CustomerContent;
        }
        field(56; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(57; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Variant".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(58; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(59; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
        }
        field(60; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(61; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(65; "Stop Code"; Code[10])
        {
            Caption = 'Stop Code';
            DataClassification = CustomerContent;
            TableRelation = Stop;
        }
        field(66; "Scrap Code"; Code[10])
        {
            Caption = 'Scrap Code';
            DataClassification = CustomerContent;
            TableRelation = Scrap;
        }
        field(68; "Work Center Group Code"; Code[10])
        {
            Caption = 'Work Center Group Code';
            DataClassification = CustomerContent;
            TableRelation = "Work Center Group";
        }
        field(69; "Work Shift Code"; Code[10])
        {
            Caption = 'Work Shift Code';
            TableRelation = "Work Shift";
            DataClassification = CustomerContent;
        }
        field(71; "Direct Cost"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Capacity Ledger Entry No." = FIELD("Entry No."),
                                                                          "Entry Type" = CONST("Direct Cost")));
            Caption = 'Direct Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(72; "Overhead Cost"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Capacity Ledger Entry No." = FIELD("Entry No."),
                                                                          "Entry Type" = CONST("Indirect Cost")));
            Caption = 'Overhead Cost';
            Editable = false;
            FieldClass = FlowField;
        }
        field(76; "Direct Cost (ACY)"; Decimal)
        {
            AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual) (ACY)" WHERE("Capacity Ledger Entry No." = FIELD("Entry No."),
                                                                                "Entry Type" = CONST("Direct Cost")));
            Caption = 'Direct Cost (ACY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77; "Overhead Cost (ACY)"; Decimal)
        {
            AutoFormatExpression = GetCurrencyCode();
            AutoFormatType = 1;
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual) (ACY)" WHERE("Capacity Ledger Entry No." = FIELD("Entry No."),
                                                                                "Entry Type" = CONST("Indirect Cost")));
            Caption = 'Overhead Cost (ACY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78; Subcontracting; Boolean)
        {
            Caption = 'Subcontracting';
            DataClassification = CustomerContent;
        }
        field(79; "Machine Id"; Code[20])
        {
            Caption = 'Machine Id';
            TableRelation = "Equipment B2B"."No.";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
        }
        key(Key2; "Document No.", "Posting Date")
        {
        }
        key(Key3; "Prod. Order No.", "Prod. Order Line No.", "Routing No.", "Routing Reference No.", "Operation No.", "Last Output Line")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = Quantity, "Output Quantity";
        }
        key(Key4; "Work Center No.", "Work Shift Code", "Posting Date")
        {
        }
        key(Key5; Type, "No.", "Work Shift Code", "Item No.", "Posting Date")
        {
        }
        key(Key6; "No.", Type, "Machine Id")
        {
            SumIndexFields = "Run Time";
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", Description, Type, "No.", "Posting Date", "Document No.")
        {
        }
    }

    var
        GLSetup: Record "General Ledger Setup";
        GLSetupRead: Boolean;

    procedure GetCurrencyCode(): Code[10];
    begin
        if GLSetupRead then begin
            GLSetup.GET();
            GLSetupRead := true;
        end;
        exit(GLSetup."Additional Reporting Currency");
    end;
}

