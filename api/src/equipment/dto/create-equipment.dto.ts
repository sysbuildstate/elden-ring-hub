export class CreateEquipmentDto {
    name!: string;
    type!: string;
    description?: string;
    scaling?: string;
    weight!: number;
}