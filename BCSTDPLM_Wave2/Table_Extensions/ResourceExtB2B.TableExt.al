tableextension 33000901 "Resource Ext B2B" extends Resource
{
    fields
    {
        field(33000890; "Designation B2B"; Code[20])
        {
            Caption = 'Designation';
            DataClassification = CustomerContent;
            TableRelation = "Designation B2B";
        }
        field(33000891; "Skill Type B2B"; Option)
        {
            Caption = 'Skill Type';
            DataClassification = CustomerContent;
            OptionCaption = '" ,All,Specific"';
            OptionMembers = " ",All,Specific;

            trigger OnValidate();
            begin
                CheckSpecificSkills();
            end;
        }
    }

    procedure CheckSpecificSkills()
    var
        ResourceSkill: Record "PM Resource Skill B2B";
    begin
        ResourceSkill.SETRANGE(Type, ResourceSkill.Type::Resource);
        ResourceSkill.SETRANGE("No.", rec."No.");
        IF NOT (ResourceSkill.IsEmpty()) THEN
            IF (NOT ("Skill Type B2B" = "Skill Type B2B"::Specific) AND (Type = Type::Person)) THEN
                ERROR(OneOrMoreErr);
    end;

    procedure CheckTypeSkills()
    Begin
        IF NOT (("Skill Type B2B" = "Skill Type B2B"::Specific) AND (Type = Type::Person)) THEN
            ERROR(SkillTypeErr);
    End;

    procedure AssignedJob() JobNo: Code[20];
    Begin
        WorkSheet.RESET();
        WorkSheet.SETRANGE("I/R Code", "No.");
        WorkSheet.SETRANGE(Posted, FALSE);
        IF WorkSheet.FINDFIRST() AND (Type = Type::Person) THEN
            EXIT(WorkSheet."Job Card No.");
    End;

    var
        WorkSheet: Record "Work Sheet B2B";
        OneOrMoreErr: Label 'One or more Specific skills are exists.';
        SkillTypeErr: Label 'Skill type must be Specific and Type must be Person.';
}

