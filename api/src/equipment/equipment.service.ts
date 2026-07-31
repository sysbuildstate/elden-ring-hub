import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateEquipmentDto } from './dto/create-equipment.dto';

@Injectable()
export class EquipmentService {
    constructor(private prisma: PrismaService) {}

    async create(dto: CreateEquipmentDto) {
        const existingItem = await this.prisma.equipment.findUnique({
            where: { name: dto.name },
        });

        if (existingItem) {
            throw new ConflictException('An item with this name already exists in the Lands Between');
        }

        return this.prisma.equipment.create({
            data: dto,
        });
    }

    async findAll() {
        return this.prisma.equipment.findMany({
            orderBy: { createdAt: 'desc' },
        });
    }

    async findOne(id: string) {
        const item = await this.prisma.equipment.findUnique({
            where: { id },
        });

        if (!item) {
            throw new NotFoundException(`Equipment with ID ${id} not found`);
        }

        return item;
    }

    async remove(id: string) {
        // Ensure the item exists before attempting to delete
        await this.findOne(id);

        return this.prisma.equipment.delete({
            where: { id },
        });
    }
}