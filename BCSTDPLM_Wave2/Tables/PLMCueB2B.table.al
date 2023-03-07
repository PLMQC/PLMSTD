table 33000892 "PLM Cue B2B"
{

    Caption = 'PLM Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(3; "Total Equipments"; Integer)
        {
            CalcFormula = Count("Equipment B2B");
            Caption = 'Total Equipments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Equipment-Running"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = FILTER(true),
                                                 "Equipment Status" = CONST(Running)));
            Caption = 'Equipment-Running';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Equipment - PMR"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = CONST(true),
                                                 "Equipment Status" = CONST("Under Preventive")));
            Caption = 'Equipment - PMR';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Equipment-Breakdown"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = CONST(true),
                                                 "Equipment Status" = CONST("Under Breakdown")));
            Caption = 'Equipment-Breakdown';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Equipment-Compliants"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = CONST(true),
                                                 "Equipment Status" = CONST("Under Complaint")));
            Caption = 'Equipment-Compliants';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "PMR- Open"; Integer)
        {
            CalcFormula = Count("PM Job Header B2B" WHERE(Type = CONST(PMR),
                                                       Status = CONST(Open),
                                                       Posted = CONST(false)));
            Caption = 'PMR- Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "PMR-Released"; Integer)
        {
            CalcFormula = Count("PM Job Header B2B" WHERE(Type = CONST(PMR),
                                                       Status = CONST(Released),
                                                       Posted = CONST(false)));
            Caption = 'Sales Credit Memos - All';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Breakdown-Open"; Integer)
        {
            Caption = 'Breakdown-Open';
            Editable = false;
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(22; "Breakdown-Released"; Integer)
        {
            CalcFormula = Count("PM Job Header B2B" WHERE(Type = FILTER(BreakDown),
                                                       Status = CONST(Released),
                                                       Posted = CONST(false)));
            Caption = 'Breakdown-Released';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(97; "Date Filter2"; Date)
        {
            Caption = 'Date Filter2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(98; Resource; Integer)
        {
            CalcFormula = Count(Resource);
            FieldClass = FlowField;
        }
        field(99; Spares; Integer)
        {
            CalcFormula = Count(Item WHERE("Item Category Code" = CONST('SPARE')));
            FieldClass = FlowField;
        }
        field(100; "In Use Equipments"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = CONST(true)));
            FieldClass = FlowField;
        }
        field(101; "Un Used Equipments"; Integer)
        {
            CalcFormula = Count("Equipment B2B" WHERE("Is In Use" = CONST(false)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }

}

