import { Body, Controller, Delete, Get, Param, Post, UseGuards } from '@nestjs/common';
import { EquipmentService } from './equipment.service';
import { CreateEquipmentDto } from './dto/create-equipment.dto';
import { AuthGuard } from '@nestjs/passport';

@Controller('equipment')
export class EquipmentController {
    constructor(private readonly equipmentService: EquipmentService) {}

    // PUBLIC: Anyone can view the catalog
    @Get()
    findAll() {
        return this.equipmentService.findAll();
    }

    // PUBLIC: Anyone can view a specific item
    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.equipmentService.findOne(id);
    }

    // PROTECTED: Only logged-in users can forge new items
    @UseGuards(AuthGuard('jwt'))
    @Post()
    create(@Body() dto: CreateEquipmentDto) {
        return this.equipmentService.create(dto);
    }

    // PROTECTED: Only logged-in users can delete items
    @UseGuards(AuthGuard('jwt'))
    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.equipmentService.remove(id);
    }
}